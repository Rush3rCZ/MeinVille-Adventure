import processing.sound.*;  //<>//
SoundFile clak;
SoundFile menu;
SoundFile game;

backGround background;
player player;
object object;
welcomeScreen welcomeScreen;
buttons buttons;
treesAndHouses treesAndHouses;
ArrayRocksAndGrass ArrayRocksAndGrass;
inventory inventory;
Items items;
difficulty difficulty;
Enemy enemy;
EnemyArray enemyArray;
ShootingArray shootingArray;
boolean welcomeScreenActivated, gameHasStarted, optionsAreOpened, optionsInGameAreOpened, gamePaused, inventoryIsOpened, readAStory;
int i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29; // i používám pro ovládání zvuku v DRAW()

void setup () {
  size (1300, 700);
  background = new backGround();
  player = new player();
  object = new object();
  welcomeScreen = new welcomeScreen ();
  buttons = new buttons();
  treesAndHouses = new treesAndHouses ();
  ArrayRocksAndGrass = new ArrayRocksAndGrass();
  inventory = new inventory ();
  items = new Items ();
  enemy = new Enemy();
  difficulty = new difficulty ();
  enemyArray = new EnemyArray ();
  shootingArray = new ShootingArray();
  welcomeScreenActivated = true;
  gameHasStarted = false;
  optionsAreOpened = false;
  gamePaused = false;
  optionsInGameAreOpened = false;
  inventoryIsOpened = false;
  readAStory = false;
  clak = new SoundFile (this, "clak.mp3");
  menu = new SoundFile (this, "MenuSound.mp3");
  game = new SoundFile (this, "inGameSound.mp3");
}


void draw () {
  background (255);
  buttons.soundsOff();
  if (welcomeScreenActivated) {

    welcomeScreen.musicInWelcomeAndOptions();  
    welcomeScreen.displayWecomingScreen();
    buttons.buttonsGetsBiggerInWelcome();
  }
  if (gameHasStarted) {
    enemy.timeStarts = true;
    enemyArray.newEnemy();
    welcomeScreen.musicInGame();
    background.display(); 
    object.displayBridgeUnder(); 
    treesAndHouses.displayHouseUnder();
    treesAndHouses.displayTreeUnder();
    ArrayRocksAndGrass.displayGrass();
    ArrayRocksAndGrass.displayRock();
    player.display();
    enemyArray.display();
    shootingArray.display();
    object.displayBridgeAbove(); 
    treesAndHouses.displayHouseAbove();
    treesAndHouses.displayTreeAbove();
    inventory.display();
    background.endBackground(); 
    background.moveBackground(); 
    player.movePlayer(); 
    player.playerBorders(); 
    buttons.displayInGame();
    player.healthBar();
    welcomeScreen.musicInGame();
  }
  if (optionsAreOpened) {
    welcomeScreen.displayOptionsScreen();
    buttons.buttonsGetBiggerInOptions();
    object.tickDisplay();
    welcomeScreen.musicInWelcomeAndOptions();
  }
  if (gamePaused) {
    welcomeScreen.musicInGame();
    pausedDisplayedTextures ();
    buttons.displayInPausedGame();
    buttons.buttonsGetsBiggerWhenGamePaused();
  }
  if (optionsInGameAreOpened) {
    welcomeScreen.musicInGame();
    pausedDisplayedTextures ();
    buttons.displayInGameOptions();
    buttons.buttonsGetsBiggerInGameOptions();
    object.tickDisplay();
  }
  if (readAStory) {
    pausedDisplayedTextures ();
    buttons.displayInReadAStory();
    buttons.buttonsGetBiggerInReadAStory();
  }
  buttons.fpsOnDisplay();
  //fill(255, 0, 0);
  //text ("mouseX: " + mouseX, mouseX, mouseY);
  //text ("mouseY: " + mouseY, mouseX, mouseY - 20);
  //text ("right: " + background.moveRightBackground, mouseX, mouseY);
  //text ("left: " + background.moveLeftBackground, mouseX, mouseY - 20);
  //text ("up: " + background.moveUpBackground, mouseX, mouseY - 40);
  //text ("down: " + background.moveDownBackground, mouseX, mouseY - 60);
  //text ("enemy.y:  " + enemy.position.y, mouseX, mouseY + 20);
  //text ("numberOfItemsInInventory:  " + inventory.numberOfItemsInInventory, 20, 100);
  //text ("inventory.numberOfGrass:  " + inventory.numberOfGrass, 20, 120);
  //text ("inventory.numberOfRocks:  " + inventory.numberOfRocks, 20, 140);
  //text ("Time:  " + enemy.time + "s", mouseX, mouseY);
  //text ("EnemyArray:  " + enemyArray.enemyArray1.size(), mouseX, mouseY - 20);
  //text ("EnemyInterval:  " + enemyArray.interval + "s", mouseX, mouseY - 40);
  //text ("timeStarts:  " + enemy.timeStarts, mouseX, mouseY - 60); 


  enemyArray.timer();
}

void keyPressed() {
  if (gameHasStarted) {
    background.keyMoveBackgroundCONTROL();
    player.keyMovePlayerCONTROL();
    player.debugPlayer();
    inventory.openInventory();
    if (key == 'h') {
      player.HP = 100;
    }
  }
}


void keyReleased() {
  if (gameHasStarted) {
    background.keyDontMoveBackgroundCONTROL();
    player.keyDontMovePlayerCONTROL ();
  }
}

void mousePressed () {
  buttons.clickOnButton();
  shootingArray.newShot();
}


void pausedDisplayedTextures () {
  background.display(); 
  object.displayBridgeUnder(); 
  treesAndHouses.displayHouseUnder();
  treesAndHouses.displayTreeUnder();
  player.display();
  for (int j = enemyArray.enemyArray1.size() - 1; j >= 0; j--) {
    enemy = enemyArray.enemyArray1.get(j);
    enemy.display();
  }
  for (int i = shootingArray.SA.size() - 1; i >= 0; i--) {
    Shot shot = shootingArray.SA.get(i);
    shot.display();
  }
  treesAndHouses.displayHouseAbove();
  object.displayBridgeAbove();
  treesAndHouses.displayTreeAbove();
}
