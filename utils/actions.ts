'use server'
import db from '@/utils/db'

import { revalidatePath } from 'next/cache'

export const createProfile = async (formData: FormData) => {
    try{
        await db.profile.create({
            data: {
                firstName: formData.get('firstName')?.toString() || '',
                lastName: formData.get('lastName')?.toString() || '',
                contactNumber: formData.get('contactNumber')?.toString()
            },
        })
    }
    catch(e: any){
        console.log(e.message)
    }

    revalidatePath('/Profiles')
}