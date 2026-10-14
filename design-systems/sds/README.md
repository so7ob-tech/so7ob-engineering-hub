# So7ob Design System (SDS) — specification v0.1

**Maturity: planned specification; no component package implemented or tested yet.** SDS is a white-label design-system foundation, not a fixed So7ob-branded skin. Client brand values are supplied as theme tokens; semantic roles and interaction behavior stay consistent.

## Principles

- Semantic tokens, not raw brand colors in component code.
- Arabic/English, RTL/LTR, keyboard, zoom, reduced-motion, and narrow screens are first-class test dimensions.
- Prefer native HTML semantics and progressive enhancement; meet WCAG 2.2 AA where applicable.
- Do not copy third-party design-system code or distinctive assets; evaluate licenses before adapting any code.

## Token layers

1. **Primitive:** raw palettes, font families, spacing, radii, elevation, breakpoints.
2. **Semantic:** `color.surface`, `color.text`, `color.action.primary`, `color.border`, status roles, focus ring.
3. **Component:** optional component-scoped aliases. Avoid exposing private implementation details as public API.

A tenant theme should override brand primitives and selected semantic roles through validated configuration; enforce readable contrast and include fallback fonts. Suggested JSON shape:

```json
{
  "schemaVersion": 1,
  "brand": {"primary": "#2457A7", "accent": "#10A3A3"},
  "typography": {"latin": "Inter", "arabic": "Noto Sans Arabic"},
  "mode": "system",
  "direction": "auto"
}
```

This is illustrative, not validated production token data. A future token package should provide light/dark semantic maps and generated CSS variables with schema validation.

## Foundations

- Typography: explicit Latin and Arabic font stacks; line-height/weight/number handling tested with Arabic content.
- Layout: consistent spacing scale, fluid container/grid, breakpoints defined by content rather than device names.
- Direction: use logical CSS properties (`margin-inline-start`, `inset-inline-end`); mirror directional icons only when meaning requires it; do not reverse media controls or universal icons blindly.
- Motion: short purposeful transitions, no essential information conveyed only by animation; honor `prefers-reduced-motion`.
- Focus: visible, high-contrast focus treatment; no keyboard traps; preserve logical tab order in both directions.
- Color: semantic state plus text/icon/shape cues; verify contrast after tenant overrides.

## Component roadmap (planned)

Phase A: Button, TextField, Select, Checkbox/Radio, FormField, Dialog, Toast, Tabs, Breadcrumbs, Pagination.
Phase B: DataTable, filters, Search, Date/Time Picker, Card, Drawer, Navigation/Sidebar, upload/file listing, empty/loading/error states.
Phase C: chart wrappers, workflow patterns, domain-specific composition examples.

Every component contract should include semantic markup, props/events, keyboard behavior, validation and error states, RTL example, theming tokens, responsive behavior, accessibility test cases, and deprecation policy. Complex widgets require assistive-technology testing, not just automated scans.

## White-labeling and release

Theme configuration is per product/tenant with validated allowlisted token overrides; do not permit arbitrary CSS injection from untrusted tenant admins. Version tokens and components together under semantic versioning; publish migration notes and visual regression screenshots. A Storybook, Figma mapping, and component code are planned deliverables, not present in v0.1.