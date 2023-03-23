import { PrismaClient } from "@prisma/client";
import { NextApiRequest,NextApiResponse } from "next";


const prisma = new PrismaClient();

// eslint-disable-next-line import/no-anonymous-default-export
export default async function (req:NextApiRequest, res:NextApiResponse){
   const {method} = req;
   try {
      switch (method) {
         case "GET":
            const ciudad = await prisma.city.findMany();
            if(ciudad){
               res.json(ciudad);
            }else {
               res.status(404).json({message:"No se encontro ninguna ciudad"});
            };
          case "POST":
            res.json({message:"Se Creo Correctamente"})
      
         default:
           res.status(400).json({mesaage:"No se encontro la ruta"})
      }
   } catch (error) {
console.log(error);
   };
};