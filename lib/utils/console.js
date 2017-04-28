const PRODUCTION = process.env.NODE_ENV === 'production'

const EMPTY = () => {}

export const log   = PRODUCTION ? EMPTY : console.log
export const warn  = PRODUCTION ? EMPTY : console.warn
export const error = PRODUCTION ? EMPTY : console.error
