import Box from '@mui/material/Box';
import { SubmitButton } from './SubmitButton';
import { createProfile } from '@/utils/actions';

export default function StoryForm({ children }: { children: any }) {
    return (
        <Box
            component="form"
            sx={{
                '& > :not(style)': { m: 1 },
            }}
            action={createProfile}
        >
            {children}
            <SubmitButton />
        </Box>
    )
}