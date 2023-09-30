const mongoose = require('mongoose');
const { playerSchema } = require('./player');


roomSchema = new mongoose.Schema({
    word:{
        required:true,
        type: String
    },
    name:{
        required : true,
        type:String,
        unique:true,
        trim:true
    },
    occupancy:{
        required: true,
        type: Number,  
        default:4
    },
    max_rounds:{
        required:true,
        type:Number
    },
    currentRound:{
        required:true,
        type:Number,
        default:1,
    },
    players:[playerSchema],
    isJoin:{
        type:Boolean,
        default:true,
    },
    turn:playerSchema,
    turnIndex:{
        type:Number,
        default:0,
    },

})

gameModel = mongoose.model('Room',roomSchema);
module.exports=gameModel;