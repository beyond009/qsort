import Int "mo:base/Int";
import Int32 "mo:base/Int32";
import Nat32 "mo:base/Nat32";
import Debug "mo:base/Debug";
var a : Nat = 3;
var ll:Int = Int32.toInt(Int32.fromNat32(Nat32.fromNat(a)));
Debug.print(Int.toText(ll));