'use client'

import { useFormStatus } from "react-dom"
import Button from '@mui/material/Button';

export function SubmitButton(){
    const {pending} = useFormStatus();
    return (
        <Button type="submit" variant="contained" disabled={pending}>Submit</Button>
    )
}