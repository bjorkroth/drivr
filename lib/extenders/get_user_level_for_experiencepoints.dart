class GetUserLevelForExperiencePoints{
  int getLevel(int experience){
    int currentLevel = 1;

    if(experience > 35){
      currentLevel = 2;
    }

    if(experience > 100){
      currentLevel = 3;
    }

    if(experience > 250){
      currentLevel = 4;
    }

    if(experience > 600){
      currentLevel = 5;
    }

    return currentLevel;
  }
}