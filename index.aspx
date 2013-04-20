<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BasicChat.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Dice Chat</title>
</head>
<body>
    <p>Name
        <input type="text" id="name" value=" " /></p>
    <p>Message
        <input type="text" id="msg" value=" " />
        <input type="button" id="send" value="send" /></p>
    <p>Roll
        <input type="text" id="howmany" value=" " size="3" />
        <input type="text" id="typeofdice" value=" " size="2" />
        sided dice
        <input type="button" id="roll" value="roll" /></p>

    <ul id="message">
    </ul>

    <script src="Scripts/jquery-1.8.3.min.js"></script>
    <script src="Scripts/jquery.signalR-1.0.0.min.js"></script>
    <script type="text/javascript" src='<%= ResolveClientUrl("~/signalr/hubs") %>'></script>
    <script>
        $(function () {
            var chat = $.connection.diceChat;

            chat.client.send = function (message) {
                $('#message').append('<li>' + message + '</li>');
            };

            $.connection.hub.start().done(function () {
                $('#send').click(function () {
                    chat.server.send($('#msg').val(), $('#name').val());
                    $('#msg').val('').focus();
                });

                $('#roll').click(function () {
                    chat.server.roll($('#howmany').val(), $('#typeofdice').val(), $('#name').val());
                    $('#howmany').val('').focus();
                    $('#typeofdice').val('').focus();
                });
            });
        });
    </script>
</body>
</html>
