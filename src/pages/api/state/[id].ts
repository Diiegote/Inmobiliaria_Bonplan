import { PrismaClient } from "@prisma/client";
import { NextApiRequest, NextApiResponse } from "next";


export default async function state(req: NextApiRequest, res: NextApiResponse) {
   const { id } = req.query
   const { method } = req
   const Id = Number(id)
   try {
      const prisma = new PrismaClient();
      switch (method) {
         case "GET":
            const response = await prisma.state.findUnique({
               where: {
                  id: Id,
               }
            })
           if(response){
            return res.json(response);
           } else{
            res.status(404).json({message:"No se encontro el estado"});
           }

         case "PUT":
            return res.json({ Message: "Editado Correctamente" })

         case "DELETE":
            return res.json({ Message: "Borrado Correctamente" })

         default:
            res.status(400).json({ Message:"No se encontro la ruta"})
      }
   } catch (error) {
      console.log(error)
   }
}