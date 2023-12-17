'use server'
import db from '@/utils/db'

import { revalidatePath } from 'next/cache'

export const newProfile = async (formData: FormData) => {
    const Profile = await db.profile.create({
        data: {
            firstName: formData.get('firstName')?.toString() || '',
            lastName: formData.get('lastName')?.toString() || '',
            contactNumber: formData.get('contactNumber')?.toString()
        },
    })

    revalidatePath('/Profiles')
}