#pragma once
#ifndef DELETEDB_H
#define DELETEDB_H

#include "UserComands.h"

class DeleteDB
{
public:
   
   void createDeletedData(const int id);
   bool verify_deleted(const int id);
   void removeDeletedData(const int id);

};
#endif