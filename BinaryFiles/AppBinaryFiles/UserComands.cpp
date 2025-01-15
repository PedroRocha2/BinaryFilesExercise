#include "AppTestDB.h"
#include "UserComands.h"

void CommandsAddUser::execute()
{  
   User user,newUser;
   auto& db = app.getDB();
   auto& deletedDB = app.getDeleted();
   
   if (!app.getUI().createUser(newUser))
      return;

   db.clearErrorFlag();
   db.seekToStart();

   while (db.readUser(user)) {
      if (deletedDB.verify_deleted(user.id)) {
         deletedDB.removeDeletedData(user.id);
         db.seekBack(sizeof(user.id) + sizeof(user.name));
         db.writeUser(newUser);
         return;
      }
   }

   db.clearErrorFlag();
   db.seekToEnd();
   db.writeUser(newUser);
}

//////////////////////////////////////////////////////////////////////////

void CommandsPrintUser::execute()
{  
   User user;
   auto& db= app.getDB();
   auto& deletedDB= app.getDeleted();

   db.clearErrorFlag();
   db.seekToStart();

   while (db.readUser(user)) {
      if (!deletedDB.verify_deleted(user.id))
         app.getUI().printData(user);
   }
}

///////////////////////////////////////////////////////////////////////////

void CommandsUpdateUser::execute()
{
   User user,newUser;
   auto& db = app.getDB();
   auto& deletedDB = app.getDeleted();
   int id = app.getUI().updateDecision();

   if (!app.getUI().createUser(newUser))
      return;

   if (deletedDB.verify_deleted(id))
      return;

   db.clearErrorFlag();
   db.seekToStart();

   while (db.readUser(user)) {
      if (user.id == id) {
         db.seekBack(sizeof(User));
         db.writeUser(newUser);
         break;
      }
   }
}
 
///////////////////////////////////////////////////////////////////////////

void CommandsDeleteUser::execute()
{
   User user;
   auto& db = app.getDB();
   auto& deletedDB = app.getDeleted();
   int id = app.getUI().deleteDecision();

   db.clearErrorFlag();
   db.seekToStart();

   while (db.readUser(user)) {
      if (user.id == id) {
         deletedDB.createDeletedData(id);
         return;
      }
   }
}
