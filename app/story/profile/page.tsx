'use client'
import { useState } from 'react';
import StoryForm from '@/components/StoryForm';
import FormControl from '@mui/material/FormControl';
import Input from '@mui/material/Input';
import InputLabel from '@mui/material/InputLabel';
import Button from '@mui/material/Button';
import TableCell from '@mui/material/TableCell';
import Typography from '@mui/material/Typography';
import IconButton from '@mui/material/IconButton';
import DeleteIcon from '@mui/icons-material/Delete';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import ListItemText from '@mui/material/ListItemText';
import Avatar from '@mui/material/Avatar';
import Grid from '@mui/material/Grid';
import FolderIcon from '@mui/icons-material/Folder';

export default function ProfileForm() {
    const [emails, setEmails] = useState([{ value: '', isPrimary: true }]);

    const handleEmailChange = (index) => (event) => {
        const newEmails = [...emails];
        newEmails[index].value = event.target.value;
        setEmails(newEmails);
    };

    const addEmailField = () => {
        setEmails([...emails, { value: '', isPrimary: false }]);
    };

    const deleteEmailField = () => {

    }

    return (
        <StoryForm>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="firstName">First Name</InputLabel>
                <Input id="firstName" />
            </FormControl>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="lastName">Last Name</InputLabel>
                <Input id="lastName" />
            </FormControl>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="contactNumber">Contact Number</InputLabel>
                <Input id="contactNumber" />
            </FormControl>
            <FormControl variant="standard" required>
                <InputLabel htmlFor="email">Email</InputLabel>
                <Input id="email" />
            </FormControl>

        </StoryForm >
    );
}
