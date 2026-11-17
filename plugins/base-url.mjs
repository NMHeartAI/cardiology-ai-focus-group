// MyST adds the site's base URL to links but not to iframes, so `/slides/...` would point
// outside the repo's GitHub Pages site. Prefix BASE_URL (set by the deploy workflow) to
// root-relative iframe addresses; locally BASE_URL is unset and they are left alone.
const baseUrlTransform = {
  name: 'base-url',
  doc: 'Prefix BASE_URL to root-relative iframe addresses.',
  stage: 'project',
  plugin: (_, utils) => (tree) => {
    const base = (process.env.BASE_URL ?? '').replace(/\/$/, '');
    if (!base) return;
    for (const node of utils.selectAll('iframe', tree)) {
      const src = node.src;
      if (typeof src === 'string' && src.startsWith('/') && !src.startsWith('//') && !src.startsWith(`${base}/`)) {
        node.src = `${base}${src}`;
      }
    }
  },
};

export default {
  name: 'Base URL',
  transforms: [baseUrlTransform],
};
