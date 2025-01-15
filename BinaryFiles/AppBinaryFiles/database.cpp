#include "database.h"
#include <iostream>

bool Database::readUser(User& user) {
   file.read((char*)&user.id,sizeof(user.id));
   file.read(user.name,sizeof(user.name));
   return file.good();
}
 
void Database::writeUser(const User& user) 
{
   file.write((char*)&user.id,sizeof(user.id));
   file.write(user.name,sizeof(user.name));
   file.flush();
}

void Database::seekToStart() 
{
   file.seekg(0);
}

void Database::seekToEnd() {
   file.seekp(0,std::ios::end);
}

void Database::seekBack(std::streamoff offset) {
   file.seekp(-offset,std::ios::cur);
}

void Database::clearErrorFlag() {
   file.clear();
}