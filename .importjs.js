module.exports = {
  logLevel: 'debug',
  namedExports: {
    react: [
      'memo',
      'useEffect',
      'useState',
      'useRef',
      'useContext',
      'useLayoutEffect',
      'useMemo'
    ],
  },
  importStatementFormatter: ({ importStatement }) => {
    return importStatement.replace(/;$/, '');
  },
  sortImports: false,
  groupImports: true
}
