import type { NextApiRequest, NextApiResponse } from 'next'
import { PrismaClient } from '@prisma/client'
import axios from 'axios'

const prisma = new PrismaClient({ log: ['query', 'info'] })

export default async function index(req: NextApiRequest,res: NextApiResponse) {
    const state_col = (await axios("https://raw.githubusercontent.com/marcovega/colombia-json/master/colombia.min.json")).data
    console.log(state_col[1].ciudades.length)

    const state = await state_col[31].ciudades.map( async (a)=>{
        const dc = await prisma.city.createMany({
            data:{
                name: a,
                stateId: 32
            }
        })
    })
    res.status(200).json("Listo")
    /* const user = await prisma.user.findMany()
    res.status(200).json(user) */
}