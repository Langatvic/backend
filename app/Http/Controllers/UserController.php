<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();
        
        // Use the isAdmin method
        if (!$user->isAdmin()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }
        
        $users = User::with('role')
            ->where('id', '!=', $request->user()->id)
            ->orderBy('created_at', 'desc')
            ->get();
        
        return response()->json($users);
    }
    
    public function destroy(Request $request, $id)
    {
        if (!$request->user()->isAdmin()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }
        
        $user = User::findOrFail($id);
        
        if ($user->id === $request->user()->id) {
            return response()->json(['message' => 'Cannot delete your own account'], 400);
        }
        
        if ($user->orders()->count() > 0) {
            $inactiveRole = Role::where('slug', 'inactive')->first();
            $user->role_id = $inactiveRole?->id ?? 1;
            $user->save();
            return response()->json(['message' => 'User has been deactivated (has existing orders)']);
        }
        
        $user->delete();
        
        return response()->json(['message' => 'User deleted successfully']);
    }
    
    public function updateRole(Request $request, $id)
    {
        if (!$request->user()->isAdmin()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }
        
        $validator = validator($request->all(), [
            'role' => 'required|string|exists:roles,slug'
        ]);
        
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        
        $user = User::findOrFail($id);
        
        if ($user->id === $request->user()->id) {
            return response()->json(['message' => 'Cannot change your own role'], 400);
        }
        
        $role = Role::where('slug', $request->role)->first();
        $user->role_id = $role->id;
        $user->save();
        
        return response()->json([
            'user' => $user->fresh()->load('role'),
            'message' => 'User role updated successfully'
        ]);
    }
}