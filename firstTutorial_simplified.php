<?php
  
require_once('config.inc.php');


function getRequestParams($keys) {

  $paramsArray = array();
  try {
   
    foreach( $keys as $key ) {
      if ( isset($_GET[$key]) )
        $paramsArray[$key] = $_GET[$key]; 
      else 
        throw new Exception($key .' parameter is not passed in GetPOI request.');
    }
    return $paramsArray;
  }
  catch(Exception $e) {
    echo 'Message: ' .$e->getMessage();
  }
}
function connectDb() {
  try {
    $dbconn = 'mysql:host=' . DBHOST . ';dbname=' . DBDATA ; 
    $db = new PDO($dbconn , DBUSER , DBPASS , array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
  
    $db->setAttribute(PDO::ATTR_ERRMODE , PDO::ERRMODE_EXCEPTION);
     return $db; 
  }
  catch(PDOException $e) {
    error_log('message:' . $e->getMessage());
  }
}


function changetoFloat($string) {
  if (strlen(trim($string)) != 0) 
    return (float)$string;
  return NULL;
}
function changetoInt($string) {
  if (strlen(trim($string)) != 0) 
    return (int)$string;
  return NULL;
} 
function changetoArray($string, $separator){
  $newArray = array();
  if($string) {
    if (substr_count($string,$separator)) {
      $newArray= array_map('trim' , explode($separator, $string));
        }
    else 
      $newArray[0] = trim($string);
  }
  return $newArray;
}
function changetoBool($value_Tinyint) {
  if (strlen(trim($value_Tinyint)) != 0) {
    if ($value_Tinyint == 0)
      return FALSE;
    else 
      return TRUE;
   }
  return NULL;
}
function getPoiActions($db , $poi) {
  $actionArray = array();
 $sql_actions = $db->prepare(' 
      SELECT label, 
             uri, 
             contentType,
             activityType,
             autoTriggerRange,
             autoTriggerOnly,
             params
      FROM POIAction
      WHERE poiID = :id '); 
  $sql_actions->bindParam(':id', $poi['id'], PDO::PARAM_STR);
  $sql_actions->execute();
  $count = 0; 
  $actions = $sql_actions->fetchAll(PDO::FETCH_ASSOC);
  if ($actions) {
    foreach ($actions as $action) { 
      $action['activityType'] = changetoInt($action['activityType']);
      $action['autoTriggerRange'] = changetoInt($action['autoTriggerRange']);
      $action['autoTriggerOnly'] = changetoBool($action['autoTriggerOnly']);
      $action['params'] = changetoArray($action['params'] , ',');
      $actionArray[$count] = $action;
      $count++; 
    }
  }
  return $actionArray;
}
function getIcon($db, $iconID) {
  $icon = NULL;  
  $sql_icon = $db->prepare( '
            SELECT url, type
              FROM Icon
             WHERE id = :iconID  
            ' );
  $sql_icon->bindParam(':iconID', $iconID, PDO::PARAM_INT);
  $sql_icon->execute();
  $rawIcon = $sql_icon->fetch(PDO::FETCH_ASSOC);
  if($rawIcon){
    $rawIcon['type'] = changetoInt($rawIcon['type']);
    $icon = $rawIcon;
  }    
  return $icon;
}

function getCheckboxValue($checkboxlist) {    
  if(isset($checkboxlist)) {
    $checkbox_value = 0;
    if (!empty($checkboxlist)) {
      if (strstr($checkboxlist , ',')) {
        $checkbox_array = explode(',' , $checkboxlist);
        for($i=0; $i<count($checkbox_array); $i++)
          $checkbox_value += $checkbox_array[$i];    
      }
      else
        $checkbox_value = $checkboxlist;
    }
    return $checkbox_value;
  }
  else {
    throw new Exception("checkboxlist parameter is not passed in GetPOI request.");
  }
}
function getSliderValue ($customslider) {
  
    if(isset($customslider))
      return $customslider;
    else
      throw new Exception("custom slider parameter is not passed in GetPOI request.");
}

function getHotspots( $db, $value ) {
  $hotspots = array();
  $sql = $db->prepare( '
              SELECT id,
                     imageURL,
                     title,
                     description,
                     footnote,
                     lat,
                     lon,
                     (((acos(sin((:lat1 * pi() / 180)) * sin((lat * pi() / 180)) +
                        cos((:lat2 * pi() / 180)) * cos((lat * pi() / 180)) *
                        cos((:long  - lon) * pi() / 180))
                       ) * 180 / pi()
                      )* 60 * 1.1515 * 1.609344 * 1000
                     ) as distance,
                     iconID
                FROM POI
               WHERE poiType = "geo"
                 AND (Checkbox & :checkbox) != 0
              HAVING distance < :radius
            ORDER BY distance ASC
               LIMIT 0, 50 ' );

 
  $sql->bindParam(':lat1', $value['lat'], PDO::PARAM_STR);
  $sql->bindParam(':lat2', $value['lat'], PDO::PARAM_STR);
  $sql->bindParam(':long', $value['lon'], PDO::PARAM_STR);
  $sql->bindParam(':radius', $value['radius'], PDO::PARAM_INT);

 
  $sql->bindParam(':checkbox', getCheckboxValue($value['CHECKBOXLIST']), PDO::PARAM_INT);

  $sql->execute();

  $i = 0;
 
  $rawPois = $sql->fetchAll(PDO::FETCH_ASSOC);
 
  if ($rawPois) {
   
    foreach ( $rawPois as $rawPoi ) {

      $poi = array();
      $poi['id'] = $rawPoi['id'];
      $poi['imageURL'] = $rawPoi['imageURL'];
     
      $poi['anchor']['geolocation']['lat'] = changetoFloat($rawPoi['lat']);
      $poi['anchor']['geolocation']['lon'] = changetoFloat($rawPoi['lon']);
     
      $poi['text']['title'] = $rawPoi['title'];
      $poi['text']['description'] = $rawPoi['description'];
      $poi['text']['footnote'] = $rawPoi['footnote'];
     
      $poi['actions'] = getPoiActions($db, $rawPoi);
     
      if(count($rawPoi['iconID']) != 0)
        $poi['icon'] = getIcon($db , $rawPoi['iconID']);
      
      $hotspots[$i] = $poi;
      $i++;
    }
  }
  return $hotspots;
}
$keys = array( 'layerName', 'lat', 'lon', 'radius','CHECKBOXLIST');
$requestParams = array(); 
$requestParams = getRequestParams($keys);
$db = connectDb(); 
$response = array();
$response['layer'] = $requestParams['layerName'];
$response['hotspots'] = getHotspots($db, $requestParams);
if (!$response['hotspots'] ) {
	$response['errorCode'] = 20;
 	$response['errorString'] = 'Пожалуйста увеличьте радиус';
}
else {
  $response['errorCode'] = 0;
  $response['errorString'] = 'ok';
}
$jsonresponse = json_encode( $response );
	header( 'Content-type: application/json; charset=utf-8' );
	echo $jsonrespon
