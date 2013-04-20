using System;
using Microsoft.AspNet.SignalR;

namespace DiceChat
{
    public class DiceChat : Hub
    {
        public void Send(string message, string name)
        {
            Clients.All.send(String.Format("{0}: {1}", name, message));
        }


        public void Roll(int howMany, int typeOfDice, string name)
        {
            int diceTotal = 0;
            string diceRolled = "";
            Random rnd = new Random();
            
            for (int i = 1; i <= howMany; i++)
            {
                int roll;

                roll = rnd.Next(typeOfDice) + 1;
                diceRolled = diceRolled + roll.ToString() + " ";
                diceTotal = diceTotal + roll;
            }
            Clients.All.send(String.Format("{0} rolled {1} {2}-sided dice ({3}) and got a {4}", name, howMany, typeOfDice, diceRolled.Trim(), diceTotal));
        }
    }
}