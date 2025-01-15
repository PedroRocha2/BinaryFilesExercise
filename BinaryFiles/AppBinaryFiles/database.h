#pragma once
#ifndef DATABASE_H
#define DATABASE_H

#include <fstream>
#include "User.h"

class Database {
public:
   Database() : file("C:/database/users.dat",std::ios::binary | std::ios::in | std::ios::out) {
      if (!file) {
         file.clear();
         file.open("C:/database/users.dat",std::ios::binary | std::ios::out);
         file.close();
         file.open("C:/database/users.dat",std::ios::binary | std::ios::in | std::ios::out);
      }
   }

   ~Database() { file.close(); }

   bool readUser(User& user);

   void writeUser(const User& user);

   void seekToStart();

   void seekToEnd();
   
   void seekBack(std::streamoff offset);

   void clearErrorFlag();

private:
   std::fstream file;
};

#endif 