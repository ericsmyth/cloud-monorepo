import type { SiteConfig } from './types';

export async function loadSiteConfig(): Promise<SiteConfig> {
  const response = await fetch('/config.json', {
    cache: 'no-store',
  });

  if (!response.ok) {
    throw new Error(`Failed to load site config: ${response.status}`);
  }

  return (await response.json()) as SiteConfig;
}

function setText(id: string, value?: string): void {
  if (!value) return;

  const element = document.getElementById(id);
  if (element) {
    element.textContent = value;
  }
}

function setHref(id: string, href?: string, label?: string): void {
  if (!href) return;

  const element = document.getElementById(id) as HTMLAnchorElement | null;
  if (!element) return;

  element.href = href;
  if (label) {
    element.textContent = label;
  }
}

export function applySiteConfig(config: SiteConfig): void {
  document.title = `${config.companyName} | ${config.tagline}`;

  setText('company-name', config.companyName);
  setText('hero-tagline', config.tagline);
  setText('hero-description', config.description);

  setText('about-company-name', config.companyName);
  setText('about-description', config.description);
  setText('contact-email-text', config.email);
  setText('contact-phone-text', config.phone);
  setText('contact-location-text', config.location);

  setHref('contact-email-link', `mailto:${config.email}`, config.email);
  setHref('linkedin-link', config.links?.linkedin, 'LinkedIn');
  setHref('github-link', config.links?.github, 'GitHub');

  const servicesList = document.getElementById('services-list');
  if (servicesList && Array.isArray(config.services)) {
    servicesList.innerHTML = '';

    for (const service of config.services) {
      const item = document.createElement('li');
      item.textContent = service;
      servicesList.appendChild(item);
    }
  }
}