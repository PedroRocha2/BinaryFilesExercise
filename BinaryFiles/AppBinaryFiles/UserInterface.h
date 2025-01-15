#pragma once
#ifndef USERINTERFACE_H
#define USERINTERFACE_H

class User;
class UserInterface
{ 
public:
   
   void printData(const User& user);

   bool createUser(User& user);

   int clientDecision() const;
   
   int updateDecision() const;
   
   int deleteDecision() const;
   
};

#endif