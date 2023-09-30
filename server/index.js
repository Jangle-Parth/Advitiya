const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
const { Socket } = require("socket.io");
var io = require("socket.io")(server);
const Room = require('./models/room');
const getWord  = require('./api/getword')
app.use(express.json());

const DB = 'mongodb+srv://Jangle_Parth:parth123@cluster0.cmdqp1y.mongodb.net/?retryWrites=true&w=majority&appName=AtlasApp';

mongoose.connect(DB).then(() => {
    console.log("Sucess");
}).catch((e) =>{
    console.log(e);
})
io.on('connection',(socket) =>{
    console.log('connected');
    socket.on('create-game',async({nickname,name,occupancy,maxRounds}) =>{
        try{
            existing = await Room.findOne({name});
            if(existing){
                socket.emit('not correct game','Room with that name already exist');
                return;
            }
            let room = new Room();
            const word = getWord();
            room.word=word;
            room.name=name;
            room.occupancy=occupancy;
            room.maxRounds=maxRounds
            let player ={

                socketID:socket.id,
                nickname,
                isPartyLeader:true,

            }
            room.players.push(player);
            room = await room.save();
            socket.join(room);
            io.to(name).emit('update room',room)

        }
        catch(err){
            console.log(err);
            
        }

    })

})

server.listen(port,"0.0.0.0",() =>{
    console.log("server running on"+port);
})
