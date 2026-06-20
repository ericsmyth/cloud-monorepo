export interface SiteLinks {
    linkedin?: string;
    github?: string;
}
  
export interface SiteConfig {
companyName: string;
tagline: string;
description: string;
email: string;
phone?: string;
location?: string;
links?: SiteLinks;
services?: string[];
}