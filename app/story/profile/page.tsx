'use client'
import StoryForm from '@/components/StoryForm';
import { SubmitButton } from '@/components/SubmitButton';
import { createProfile } from '@/utils/actions';
// import { newProfile } from '@/utils/actions';
import FormControl from '@mui/material/FormControl';
import Input from '@mui/material/Input';
import InputLabel from '@mui/material/InputLabel';

export default function ProfileForm() {

    return (
        <StoryForm>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="firstName">First Name</InputLabel>
                <Input id="firstName" name="firstName"/>
            </FormControl>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="lastName">Last Name</InputLabel>
                <Input id="lastName" name="lastName"/>
            </FormControl>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="contactNumber">Contact Number</InputLabel>
                <Input id="contactNumber" name="contactNumber"/>
            </FormControl>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="email">Email</InputLabel>
                <Input id="email" name="email"/>
            </FormControl>
        </StoryForm >
    );
}
