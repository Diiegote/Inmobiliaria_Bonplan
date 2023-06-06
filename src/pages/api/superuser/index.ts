import { NextApiRequest, NextApiResponse } from "next";



// eslint-disable-next-line import/no-anonymous-default-export
export default async function (_req: NextApiRequest, res: NextApiResponse) {

   try {
      res.status(404).json({ message: 'Not Found' });
   } catch (error: any) {
      console.log(error.message);
   }
}