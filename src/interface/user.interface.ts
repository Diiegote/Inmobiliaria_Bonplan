export interface User {
   readonly id: number;
   readonly email: string;
   name: string;
   lastname: string
   password: string
   phone: string;
   superuser: boolean;
   readonly created_at: Date;
   updatedAt: Date;
}

export interface UserAdd extends Omit<User, 'id' | 'created_at' | 'updatedAt'> { }

export interface UserUpdate extends Omit<UserAdd, 'email'> { }

export interface SuperUser extends Omit<UserUpdate, 'name' | 'lastname' | 'password' | 'phone'> { }