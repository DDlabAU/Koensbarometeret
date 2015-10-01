  //forbindelser:
  int hoved = 2;
  int overkrop = 3;
  int vh = 4;
  int hh = 5;
  int ben = 6;
  int vf = 7; 
  int hf = 8; 

  int kropsdele[] = {hoved, overkrop, vh, hh, ben, vf, hf};
  //Knapper:
  int beregn = 12;
  int reset = 11;
  int antal = 0;

  void setup(){

    for(int i = 0; i < kropsdele.length; i++){
      pinMode(kropsdele[i], INPUT_PULLUP);  
    }
    
    pinMode (beregn, INPUT_PULLUP);
    pinMode (reset, INPUT_PULLUP);
    Serial.begin(9600);
    Serial.println("start");
  }
  
  void loop(){  
    
    if(digitalRead(beregn) == LOW){
      total();
      Serial.println(antal);
      delay(500);
    }
     
    if(digitalRead(reset) == LOW){
        antal = 0;
        Serial.println("r");
        delay(500);
    }      
    
    delay(100);
  }
  
 void total()
 {
    antal = kropsdele.length;
    for(int i = 0; i < kropsdele.length; i++){
      antal -= digitalRead(kropsdele[i]);  
    }
 }
 
 
