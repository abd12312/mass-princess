// Parse "available shades" lines from product descriptions.
// Arabic: "الدرجات المتوفرة: 1، 2، 3"  — English: "Available shades: 1, 2, 3"

const AR_RE = /الدرجات المتوفرة\s*:\s*(.+)/;
const EN_RE = /available shades\s*:\s*(.+)/i;

export function parseShades(desc: string | null | undefined): string[] {
  if (!desc) return [];
  const m = desc.match(AR_RE) ?? desc.match(EN_RE);
  if (!m) return [];
  return m[1]
    .split(/[،,]/)
    .map((s) => s.trim())
    .filter(Boolean);
}

export function stripShadesLine(desc: string | null | undefined): string | null {
  if (!desc) return desc ?? null;
  return desc
    .replace(AR_RE, "")
    .replace(EN_RE, "")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
}
