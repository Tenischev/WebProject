<?php
class Template{
  private $defoltPath = './template/';
  private $textFile = '';

  function load($nameFile){
    $this->textFile = file_get_contents($this->defoltPath . $nameFile);
  }
  
  function set($param, $string){
    $this->textFile = str_replace($param, $string, $this->textFile);
  }
  
  function compile(){
    echo $this->textFile;
  }
}
$tpl = new Template();
?>