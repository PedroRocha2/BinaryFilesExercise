#include "AppTestDB.h"

AppTestDB app;

static void newCommand(Commands* actualcmd)
{
   if (actualcmd)
      actualcmd->execute();
   
   delete actualcmd;
}

void AppTestDB::run()
{
   bool loop= true;
   while (loop) {

      switch (app.getUI().clientDecision()) {
      case 1: newCommand(new CommandsAddUser); break;

      case 2: newCommand(new CommandsPrintUser); break;

      case 3: newCommand(new CommandsUpdateUser); break;

      case 4: newCommand(new CommandsDeleteUser); break;

      case 5: loop= false; break;
      }
   }
}