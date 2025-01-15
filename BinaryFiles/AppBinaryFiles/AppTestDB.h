#pragma once
#include "UserInterface.h"
#include "UserComands.h"
#include "database.h"
#include "deleteDB.h"

class AppTestDB
{
public:
   void run();
   DeleteDB& getDeleted() { return deleteDB; }
   UserInterface& getUI() { return ui;}
   Database& getDB() { return db; }


private:
   Commands* actualcmd;
   DeleteDB deleteDB;
   UserInterface ui;
   Database db;
  
};

extern AppTestDB app;