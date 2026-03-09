<?php
define('BASEPATH', 'true');
define('ENVIRONMENT', 'development');
include 'application/config/database.php';
$c = $db['default'];
$mysqli = new mysqli($c['hostname'], $c['username'], $c['password'], $c['database']);
$res = $mysqli->query('DESCRIBE bank_tbl');
while ($row = $res->fetch_assoc()) {
    echo $row['Field'] . ' (' . $row['Type'] . ')' . PHP_EOL;
}
?>