// Jwt dto shape
export interface JwtDto {
  userId: string;
  sessionVersion?: number;
}

/** Authentication header name */
export const JWT_BEARER_REALM = 'Bearer';
