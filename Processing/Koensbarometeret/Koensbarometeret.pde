import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
float textX;
float textY;

String [] randomgender = { 
  
"KØNSBAROMETRETS VURDERING: \n\nDu er pangender: \nDu føler dig hverken som mand eller kvinde. Som pangender identificerer \ndu dig med alle køn. Termet overlapper med genderqueers og du \nønsker derfor at blive tiltalt med det kønsneutrale pronomen 'hen'.", 

"KØNSBAROMETRETS VURDERING: \n\nDu er nonbinær: \nDu føler dig hverken som mand eller kvinde og nægter at anerkende den \nrigide og normbaserede opdeling mellem mand og kvinde. Måske du \nføler dig som et helt tredje køn, og ønsker at tiltales ‘høn/hen’", 

"KØNSBAROMETRETS VURDERING: \n\nDu er genderqueer: \nDu identificerer dig hverken som mand eller kvinde. Du har måske en \nfølelse af, at du er hverken-eller, både-og eller en kombination \nheraf.",

"KØNSBAROMETRETS VURDERING: \n\nDu er transkønnet: \nDu identificerer dig ikke med det køn, du  blev tildelt ved fødslen. \nDu tilhører de transkønnede, hvilket er en bred definition på \nmennesker, der måske identificerer sig som intetkønnet, kønsneutral, \ngenderqueer, ikke-binær, tredje køn, bi-kønnede, pan-kønnede etc.",

"KØNSBAROMETRETS VURDERING: \n\nDu er transvestit: \nDu kan godt lide at udtrykke dig og gå i tøj der normalt associeres med \ndet modsatte køn - i større eller mindre grad. Det kan enten \nvære at du bruger tøjet til at gøre op med samfundets normer og regler \nfor kønsspecifik påklædning - eller at du holder det mere i din\nprivatsfære.",

"KØNSBAROMETRETS VURDERING: \n\nDu er bikønnet: \nDu føler dig både som mand og kvinde, hvilket du eksempelvis \nudtrykker igennem din påklædning",

"KØNSBAROMETRETS VURDERING: \n\nDu er KønX: \nDu føler dig hverken som mand eller kvinde. Det føles forkert at \nkategorisere dig som en af disse, derfor var du glad for at du i 2010 \nnu kunne søge efter at få et `x` i dit pas og i cpr-registreret",
 
"KØNSBAROMETRETS VURDERING: \n\nDu er kønsneutral: \nDu vil ikke være mand eller kvinde. Du vil være dig selv. Du vil måske gerne tiltales ‘hen'/’hon’/’høn’ i stedet for 'han' eller \n‘hun’.",

"KØNSBAROMETRETS VURDERING: \n\nDu er intetkøn: \nDin status som intetkøn vedrører ikke din biologiske sammensætning, \nmen er en grammatisk korrekt måde, at undgå de kønsbestemte \npronominer. Du føler dig hverken som udelukkende mand eller kvinde, \nog har derfor ikke lyst til at blive tiltalt som nogle af delene.",

"KØNSBAROMETRETS VURDERING: \n\nDu er genderbender: \nDu betegner dig som Gender bender, hvilket er en uformel betegnelse \nder bliver brugt om en person der aktivt overskrider eller bøjer de \nforventede kønsroller. Gender bending er en form for social aktivisme \ni modsvar til de forudindtagelser eller over generaliseringer der er i \nforhold til køn. Nogen gender benders identificerer sig med det, køn de \nblev tildelt ved fødslen, men udfordrer normerne der er knyttet til det \ngennem androgyn opførsel eller brud med de traditionelle kønsroller.",

};

void setup (){
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600); 
  size(1100, 1000);
  background(255);
  textSize (20);
  textAlign(CENTER, CENTER);
  fill(0);
  
  //Bestemmer hvor resultatteksten skal stå på skærmen
  textX = width/2;
  textY = height/2;
}

void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n');         // read it and store it in val
  }
  if(val != null){
    String temp = val.substring(0,1);
    if(temp.equals("r")){
      println("reset");
      resetmetode();
    } else {
      println("beregn");
      beregn(int(temp));
    }
  }
  val = null;
}

void resetmetode(){
  background(255);
}

void beregn(int antal){
  //array 
  background(255);
  println(antal);
  if(antal == 0){
    //kun mandetøj
    text ("KØNSBAROMETRET VURDERING: \n\nDu er en ciskønnet mand: \nDu føler dig som det køn, du fik tildelt ved fødslen", textX, textY);
  } else if(antal == 1){
    //kun mandetøj på nær ét stk kvindetøj 
    background (255);
    text ("KØNSBAROMETRET VURDERING: \n\nDu er en mand - \nder hviler i og anderkender dine feminine sider", textX, textY); 
    
  } else if(antal == 6){
    //kun kvindetøj på nær ét stk mandetøj
    text ("KØNSBAROMETRET VURDERING: \n\nDu er en kvinde - \nder omhavner dine maskuline sider", textX, textY); 
    
  } else if(antal == 7){
    //kun kvindetøj 
    text ("KØNSBAROMETRET VURDERING: \n\nDu er en ciskønnet kvinde: \nDu føler dig som det køn du fik tildelt ved fødslen", textX, textY);
  
  }
  
  else if(antal > 1 && antal <=5){
    //blandet køn
    //hent en sætning fra randomgender-listen
    int rand = int(random(randomgender.length));
    text (randomgender [rand], textX, textY); 
  }

  rectMode(CENTER);
  rect(width/2, height/2, 10, 10);
}