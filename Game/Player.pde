public class Player {

  private Control control;
  private int boatPosition = 215;
  private int boatSpeed = 4;
  private PImage [] fisherAnimation;
  private int currentFrameOfFisher;
  private float fisherAnimationDelay;
  private PImage fisher;
  private PImage hookM;
  private PImage hookU;
  private GameElement newCatch;
  private boolean caught;
  private PImage hook;
  private String name;
  private int life;

  public Player() {
    control = new Control();
    control.setSpeedX(boatSpeed);
    control.setPositionX(boatPosition);
    hookM = loadImage("Bilder.Grafikk/hook1copy.png");
    hookU = loadImage("Bilder.Grafikk/hookUtencopy.png");
    fisher = loadImage("Bilder.Grafikk/fisker.png");
    caught = false;
  }

  //Manages the boatMovement
  public void boat() {
    int xPos = control.horizontalMove();
    int rod = control.rodInteraction();
    drawFisher(); 
    //Fishingline
    line(xPos+299, 57, xPos+300, 63+rod);
    //draw hook
    //image(hookM, xPos+285, 57+rod);
    if(caught == true) {
      image(hookU, xPos+292, 57+rod);
      catchPosition(xPos+278, 50+rod);
    } else {
      image(hookM, xPos+285, 57+rod);
    }
  }

  //Sets new boat speed
  public void setBoatSpeed(int newSpeed) {
    boatSpeed = newSpeed;
    control.setSpeedX(boatSpeed);
  }

  //Sets new start x position
  public void setStartPosition(int newPositionX) {
    boatPosition = newPositionX;
    control.setPositionX(boatPosition);
  }

  //Returns Hitbox x position
  public int getHitboxCenterXPos() {
    int pos = 270 + control.horizontalMove() + (hookM.width/2);
    return pos;
  }

  //Returns Hitbox y position
  public int getHitboxCenterYPos() {
    int hitBoxYPos = 65+control.rodInteraction() + (hookM.height/2);
    return hitBoxYPos;
  }

  public int getHitboxHeight() {
    return hook.height;
  }

  public int getHitboxWidth() {
    return hook.width;
  }

  //Draws the Fisher, animates the images
  public void drawFisher() {
    int xPosFisher = control.horizontalMove();
    fisherAnimation = new PImage[5];
    fisherAnimationDelay = (fisherAnimationDelay + 0.15) % 5;
    currentFrameOfFisher =  int(fisherAnimationDelay);
    fisherAnimation[currentFrameOfFisher] = fisher.get(300*currentFrameOfFisher, 0, 300, 220);
    image(fisherAnimation[currentFrameOfFisher], xPosFisher, 30);
  }

  public void myCatch(GameElement newCatch) {
    this.newCatch = newCatch;
    caught = true;
  }

  public void catchPosition(int x, int y) {
    int xPos = x;
    int rod = y;
    newCatch.onTheHook(xPos, rod);
  }

  public boolean gotCatch() {
    return caught;
  }

  // get the name of the player
  public String getName() {
    return name;
  }

  // set the name of the player
  public String setName(String name) {
    return name;
  }

  // get the life of the player
  public int getLife() {
    return life;
  }

  // set the life of the player
  public void setLife(int life) {
    life = 3;
  }

  // set the information in the player that is going to be saved.
  public void setPlayer(String name, int life) {
    boat();
    setName(name);
    setLife(life);
  }
}