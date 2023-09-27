const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
const { Socket } = require("socket.io");
var io = require("socket.io")(server);

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

        }
        catch(err){
            
        }

    })

})

server.listen(port,"0.0.0.0",() =>{
    console.log("server running on"+port);
})
