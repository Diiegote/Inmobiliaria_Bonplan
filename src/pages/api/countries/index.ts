import type { NextApiRequest, NextApiResponse } from 'next'
import { PrismaClient } from '@prisma/client'
import axios from 'axios'
import arg from '../../../../cities-arg.json'

const prisma = new PrismaClient({ log: ['query', 'info'] })

export default async function index(req: NextApiRequest,res: NextApiResponse) {
    const state_col = (await axios("https://raw.githubusercontent.com/marcovega/colombia-json/master/colombia.min.json")).data
    console.log(state_col[1].ciudades.length)
    /* const state = await state_col[31].ciudades.map( async (a)=>{
        const dc = await prisma.city.createMany({
            data:{
                name: a,
                stateId: 32
            }
        })
    }) */

    const state_arg = arg[0].cities.map( async (a) =>{
        const existe = await prisma.city.findMany({where: {name: a}})
        if (existe){
            return 'ya existe'
        }else {
            const cargar = await prisma.city.createMany({
                data:{
                    name: a,
                    stateId: 33
                }
            })

            return "se cargo con exito"
        }
    })


    
    res.status(200).json(state_arg)
    /* const user = await prisma.user.findMany()
    res.status(200).json(user) */
}