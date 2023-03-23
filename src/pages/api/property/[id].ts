import type { NextApiRequest, NextApiResponse } from 'next'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient({ log: ['query', 'info'] })

const json1 = [{
   id: 1,
   imagen: "sdfsdf",
   m2: 30,
   type_contract: 2,
   type_propery: 1,
   state_contract: 1,
   antiquity: 30,
   price_rent: 40.000,
   price_sell: 500000000,
   description: "Casa totalemte amueblada, con vista al mar",
   bathroom: 2,
   room: 5,
   address: "posadas 465",
   name_owner: "Jose Perez",
   number_owner: "2364445455",
},
{
   id: 2,
   imagen: "sfdfsdf",
   m2: 30,
   type_contract: 2,
   type_propery: 1,
   state_contract: 1,
   antiquity: 30,
   price_rent: 40.000,
   price_sell: 500000000,
   description: "Casa totalemte amueblada, con vista al mar",
   bathroom: 2,
   room: 5,
   address: "posadas 465",
   name_owner: "Jose Perez",
   number_owner: "2364445455",
}

]

export default async function inmuebles(req: NextApiRequest, res: NextApiResponse) {
   const { method, query } = req
   try {
      switch (method) {
         case "GET":
            const results = json1.filter(x => x?.id === Number(query.id))
            return res.json(
               results[0]?.id ? results
                  : res.status(400).json({ mesaage: "No se encontro el id" }));

         case "PUT":
            return res.json({ messge: "Inmueble Editado" })

         case "DELETE":
            return res.json({ messge: "Inmueble Borrado" })

         default:
            res.status(400).json({ messge: "No se encontro la ruta" })
      }
   } catch (error) {
      console.log(error)
   }
}