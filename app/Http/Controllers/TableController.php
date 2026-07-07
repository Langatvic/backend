<?php

namespace App\Http\Controllers;

use App\Models\Table;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class TableController extends Controller
{
    public function index()
    {
        $tables = Table::all();
        return response()->json($tables);
    }

    public function getAvailableTables()
    {
        $tables = Table::where('status', 'available')->get();
        return response()->json($tables);
    }

    // Admin only
    public function store(Request $request)
    {
        $validator = validator($request->all(), [
            'table_number' => 'required|string|unique:tables',
            'capacity' => 'required|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $table = Table::create($request->all());
        
        // Generate QR code
        $qrCode = QrCode::size(200)->generate(json_encode([
            'table_id' => $table->id,
            'table_number' => $table->table_number
        ]));
        
        $table->qr_code = base64_encode($qrCode);
        $table->save();

        return response()->json($table, 201);
    }

    public function update(Request $request, $id)
    {
        $table = Table::findOrFail($id);
        $table->update($request->all());
        return response()->json($table);
    }

    public function destroy($id)
    {
        $table = Table::findOrFail($id);
        $table->delete();
        return response()->json(['message' => 'Table deleted successfully']);
    }
}