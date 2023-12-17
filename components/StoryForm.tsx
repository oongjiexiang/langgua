import Box from '@mui/material/Box';

export default function StoryForm({ children }: { children: any }) {
    return (
        <Box
            component="form"
            sx={{
                '& > :not(style)': { m: 1 },
            }}
            noValidate
            autoComplete="off"
        >
            {children}
        </Box>
    )
}