#include <iostream>
#include <cstring>
#include <string>
#include "User.h"
#include "UserInterface.h"

bool UserInterface::createUser(User& user)
{  
   std::cout << "ID do User: ";
   std::cin >> user.id;
   std::cin.ignore();

   std::cout << "Nome do User: ";
   std::string tempName;

   std::getline(std::cin,tempName);

   strncpy_s(user.name,tempName.c_str(),50);
   user.name[49] = '\0';

   return true;
}

int UserInterface::clientDecision() const
{  
   int choice;
   
   std::cout << "| 1 - Add User\n"
             << "| 2 - Read users\n"
             << "| 3 - Update User\n"
             << "| 4 - Delete User\n"
             << "| 5 - Stop\n"
             << std::endl;

   std::cin >> choice;
   system("cls");
   
   return choice;
   
}

int UserInterface::updateDecision() const
{
   system("cls");
   int id;

   std::cout << "Digite o id do usuario que deseja modificar ou digite 0 para voltar\n";
   std::cin >> id;

   return id;

}

int UserInterface::deleteDecision() const
{  
   system("cls");
   int id;

   std::cout << "Digite o ID do Usuario que deseja deletar ou 0 para voltar\n";
   std::cin >> id;

   return id;

}

void UserInterface::printData(const User& user)
{
   std::cout << "ID: " << user.id;
   std::cout << "\nNAME: " << user.name
      << std::endl;
}
