import { SuperUser, User, UserAdd, UserUpdate } from '../interface/user.interface';
import { NextApiRequest, NextApiResponse } from 'next';
import { Prisma } from '../utils/prismaclient';


export class ModelUser {

   prisma = Prisma

   constructor( private res: NextApiResponse) { };

   async getAll():Promise<User[]> {
      try {
         const users = await this.prisma.user.findMany({
            include: { contracts: true }
         });
         return users;

      } catch (error: any) {
         this.res.status(500).send(error.message);
      }
      return this.getAll()
   };

   async getOne(id: number) {

      try {
         const user = await this.prisma.user.findUnique({ where: { id: id }, include: { contracts: true } });

         !user ? this.res.status(500).send('User not found') : Promise;

         return user;

      } catch (error: any) {

         this.res.status(500).send(error.message);
      }

   };

   async add(data: UserAdd) {

      try {
         const email = await this.prisma.user.findUnique({ where: { email: data.email } });

         email ?

            this.res.status(500).send('User already added') : Promise;

         if (!data.email || !data.lastname || !data.name || !data.password || !data.phone)
            return this.res.status(500).send('the fields are required')


         const user = await this.prisma.user.create({ data: { ...data } });
         return user;


      } catch (error: any) {
         this.res.status(500).send(error.message);
      };
   };

   async update(id: number, changes: UserUpdate) {

      try {

         const searchUser = await this.prisma.user.findUnique({ where: { id: id } });
         !searchUser ? this.res.status(500).send('User not found') : Promise;

         const user = await this.prisma.user.update({
            where: { id: id },
            data: {

               name: changes.name ? changes.name : searchUser?.name,
               lastname: changes.lastname ? changes.lastname : searchUser?.lastname,
               password: changes.password ? changes.password : searchUser?.password,
               phone: changes.phone ? changes.phone : searchUser?.phone
            }
         });
         return user;

      } catch (error: any) {
         this.res.status(500).send(error.message);
      };
   };

   async updatesuperuser(id: number, changes: SuperUser) {

      try {

         const searchUser = await this.prisma.user.findUnique({ where: { id: id } });
         !searchUser ? this.res.status(500).send('User not found') : Promise;

         const user = await this.prisma.user.update({
            where: { id: id },
            data: { superuser: changes.superuser }
         });
         return user;

      } catch (error: any) {
         this.res.status(500).send(error.message);
      };
   };

   async delete(id: number) {

      try {
         const user = await this.prisma.user.findUnique({ where: { id: id }, include: { contracts: true } });

         !user ? this.res.status(500).send('User not found') : Promise;

         const deleteUser = await this.prisma.user.delete({ where: { id: id } });

         return 'User deleted'

      } catch (error: any) {
         this.res.status(500).send(error.message);
      }

   };
};