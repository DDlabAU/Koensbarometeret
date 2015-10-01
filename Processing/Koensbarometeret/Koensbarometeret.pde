import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

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
}
String [] randomgender = { 
  
"KØNSBAROMETRETS VURDERING: \n\nDu er pangender: \nDu føler dig hverken som mand eller kvinde. Som pangender identificerer \ndu dig med alle køn. Termet overlapper med genderqueers og du \nønsker derfor at blive taltalt med de kønsneutrale pronomen 'hen'.", 
"KØNSBAROMETRETS VURDERING: \n\nDu er nonbinær: \nDu føler dig hverken som mand eller kvinde og nægter at anerkende den \nrigide og normbaserede opdeling mellem mand og kvinde. Måske du \nføler dig som et helt tredje køn, og ønsker måske at tiltales ‘høn/hen’", 
"KØNSBAROMETRETS VURDERING: \n\nDu er genderqueer: \nDu identificerer dig hverken som mand eller kvinde. Du har måske en \nfølelse af, at du er hverken-eller, både-og eller en kombination \nheraf.",
"KØNSBAROMETRETS VURDERING: \n\nDu er transkønnet: \nDu identificerer dig ikke med det køn, du  blev tildelt ved fødslen. \nDu tilhører de transkønnede, hvilket er en bred definition på \nmennesker, der måske identificerer sig som intetkønnet, kønsneutral, \ngenderqueer, ikke-binær, tredje køn, bi-kønnede, pan-kønnede etc.",
"KØNSBAROMETRETS VURDERING: \n\nDu er transvestit: \nDu kan godt lide at udtrykke dig og gå i tøj der normalt associeres med \ndet modsatte køn - i større eller mindre grad. Det kan enten \nvære at du \nbruger tøjet til at gøre op med samfundets normer og regler \nfor kønsspecifik påklædning - eller at du holder det mere i din\nprivatsfære.",
"KØNSBAROMETRETS VURDERING: \n\nDu er bikønnet: \nDu føler dig både som mand og kvinde, hvilket du eksempelvis \nudtrykker igennem din påklædning",
"KØNSBAROMETRETS VURDERING: \n\nDu er genderf*ck: \nDu f'cker med dit køn. Du siger `f'ck dig` til \nog leger med den binære kønsopdeling, \nde traditionelle opfattelser af kønsidentitet og de \nsamfunds bestemte kønsroller",
"KØNSBAROMETRETS VURDERING: \n\nDu er KønX: \nDu føler dig hverken som mand eller kvinde. Det føles forkert at \nkategorisere dig som en af disse, derfor var du glad for at du i 2010 \nnu kunne søge efter at få et `x` i dit pas og i cpr-registreret", 
"KØNSBAROMETRETS VURDERING: \n\nDu er kønsneutral: \nDu vil ikke være mand eller kvinde. Du vil være dig selv. Du vil måske gerne tiltales ‘hen'/’hon’/’høn’ i stedet for 'han' eller \n‘hun’.",
"KØNSBAROMETRETS VURDERING: \n\nDu er intetkøn: \nDin status som intetkøn vedrører ikke din biologiske sammensætning, \nmen er en grammatisk korrekt måde, at undgå de kønsbestemte \npronominer. Du føler dig hverken som udelukkende mand eller kvinde, \nog har derfor ikke lyst til at blive tiltalt som nogle af delene.",
"KØNSBAROMETRETS VURDERING: \n\nDu er genderbender: \nDu betegner dig som Gender bender, hvilket er en uformel betegnelse \nder bliver brugt om en person der aktivt overskrider eller bøjer de \nforventede kønsroller. Gender bending er en form for social aktivisme \ni modsvar til de forudindtagelser eller over generaliseringer der er i \nforhold til køn. Nogen gender benders identificerer sig med det, køn de \nblev tildelt ved fødslen, men udfordrer normerne der er knyttet til det \ngennem androgyn opførsel eller brud med de traditionelle kønsroller.",

};
