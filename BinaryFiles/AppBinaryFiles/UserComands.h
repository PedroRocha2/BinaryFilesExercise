#pragma once
#ifndef USERCOMANDS_H
#define USERCOMANDS_H

#include <string>
#include "User.h"

class Commands 
{
public:
   virtual void execute()= 0;
   
};

class CommandsAddUser : public Commands
{
public:
   void execute() override;
};

class CommandsUpdateUser : public Commands
{
public:
   void execute() override;
};

class CommandsPrintUser : public Commands
{
public:
   void execute() override;
};

class CommandsDeleteUser : public Commands
{
public:
   void execute() override;
};







#endif