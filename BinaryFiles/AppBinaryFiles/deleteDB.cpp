#include <fstream>
#include <iostream>
#include <vector>
#include "deleteDB.h"
#include "UserDeleted.h"

void DeleteDB::createDeletedData(const int id)
{
   UserDeleted info;
   std::ofstream file("C:/database/users-info.dat",std::ios::binary | std::ios::app);

   info.id= id;
   
   file.write((char*)&info.id,sizeof(info.id));

   file.close();
}

bool DeleteDB::verify_deleted(const int id)
{
   UserDeleted info;
   std::ifstream file("C:/database/users-info.dat",std::ios::binary | std::ios::in);

   while (file.read((char*)&info.id,sizeof(info.id))) {
      if (info.id == id)
         return true;
   }
   return false;
}

void DeleteDB::removeDeletedData(const int id) {
   std::vector<UserDeleted> deleteds;
   UserDeleted info;
   std::ifstream file("C:/database/users-info.dat",std::ios::binary | std::ios::in);

   if (!file) {
      std::cerr << "Error, file cannot be opened" << std::endl;
      return;
   }

   while (file.read((char*)&info.id,sizeof(info.id))) {
      if (info.id != id) {
         deleteds.push_back(info);
      }
   }

   file.close();

   std::ofstream outFile("C:/database/users-info.dat",std::ios::binary | std::ios::out | std::ios::trunc);
   for (const auto& i : deleteds) {
      outFile.write((char*)&i.id,sizeof(i.id));
   }

   outFile.close();
};