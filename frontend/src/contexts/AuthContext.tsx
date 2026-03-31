import { createContext, useCallback, useContext, useEffect, useMemo, useState } from 'react'
import type { ReactNode } from 'react'
import type { User } from 'firebase/auth'
import { onAuthStateChanged, signInWithEmailAndPassword, signOut } from 'firebase/auth'
import { auth } from '../firebase'

export type UserRole = 'public' | 'rh'

interface AuthContextValue {
  user: User | null
  token: string | null
  role: UserRole
  loading: boolean
  signIn: (email: string, password: string) => Promise<void>
  signOut: () => Promise<void>
}

const AuthContext = createContext<AuthContextValue | undefined>(undefined)

const LOCAL_TOKEN_KEY = 'firebaseToken'
const LOCAL_ROLE_KEY = 'authRole'

const isBrowser = typeof window !== 'undefined'

const persistAuthState = (token: string | null, role: UserRole) => {
  if (!isBrowser) return
  if (token) {
    localStorage.setItem(LOCAL_TOKEN_KEY, token)
  } else {
    localStorage.removeItem(LOCAL_TOKEN_KEY)
  }
  localStorage.setItem(LOCAL_ROLE_KEY, role)
}

const clearAuthState = () => {
  if (!isBrowser) return
  localStorage.removeItem(LOCAL_TOKEN_KEY)
  localStorage.setItem(LOCAL_ROLE_KEY, 'public')
}

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null)
  const [token, setToken] = useState<string | null>(null)
  const [role, setRole] = useState<UserRole>('public')
  const [loading, setLoading] = useState(true)

  const syncUser = useCallback(async (firebaseUser: User | null) => {
    if (!firebaseUser) {
      setUser(null)
      setToken(null)
      setRole('public')
      clearAuthState()
      setLoading(false)
      return
    }

    const tokenResult = await firebaseUser.getIdTokenResult(true)
    const normalizedRole: UserRole = 'rh'

    setUser(firebaseUser)
    setToken(tokenResult.token)
    setRole(normalizedRole)
    persistAuthState(tokenResult.token, normalizedRole)
    setLoading(false)
  }, [])

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (firebaseUser) => {
      void syncUser(firebaseUser)
    })
    return () => unsubscribe()
  }, [syncUser])

  const handleSignIn = useCallback(async (email: string, password: string) => {
    const credentials = await signInWithEmailAndPassword(auth, email, password)
    await syncUser(credentials.user)
  }, [syncUser])

  const handleSignOut = useCallback(async () => {
    await signOut(auth)
    await syncUser(null)
  }, [syncUser])

  const value = useMemo<AuthContextValue>(() => ({
    user,
    token,
    role,
    loading,
    signIn: handleSignIn,
    signOut: handleSignOut,
  }), [user, token, role, loading, handleSignIn, handleSignOut])

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export const useAuth = () => {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
}

export const getStoredAuthToken = () => (isBrowser ? localStorage.getItem(LOCAL_TOKEN_KEY) : null)
export const getStoredRole = (): UserRole => {
  if (!isBrowser) return 'public'
  return (localStorage.getItem(LOCAL_ROLE_KEY) as UserRole) || 'public'
}
