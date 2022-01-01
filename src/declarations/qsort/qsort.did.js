export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'qsort' : IDL.Func([IDL.Vec(IDL.Int)], [IDL.Vec(IDL.Int)], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
