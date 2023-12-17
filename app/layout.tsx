import Link from 'next/link'
import './globals.css'
import { Inter } from 'next/font/google'
import { AppRouterCacheProvider } from '@mui/material-nextjs/v14-appRouter';
import '@fontsource/roboto/300.css';
import '@fontsource/roboto/400.css';
import '@fontsource/roboto/500.css';
import '@fontsource/roboto/700.css';

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'Langgua',
  description: "Pinch every interviewer's heart with the right words",
}

const links = [
  { href: '/', label: 'Home' },
  { href: '/resume', label: 'View Resume' },
  { href: '/build', label: 'Build Profile' },
]

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <AppRouterCacheProvider options={{ enableCssLayer: true }}>
          <header>
          <nav>
            <ul className="flex justify-end items-center">
              {links.map((link) => (
                <li key={link.href}>
                  <Link href={link.href} className="px-2 rounded-md">{link.label}</Link>
                </li>
              ))}
            </ul>
          </nav>
        </header>
        </AppRouterCacheProvider>
        {children}
      </body>
    </html>
  )
}
