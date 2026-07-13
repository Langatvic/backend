<?php

namespace App\Http\Controllers;

use App\Models\Food;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class FoodController extends Controller
{
    public function index()
    {
        $foods = Food::where('is_available', true)->get();
        return response()->json($foods);
    }

    public function show($id)
    {
        $food = Food::findOrFail($id);
        return response()->json($food);
    }

    public function getByCategory($category)
    {
        $foods = Food::where('category', $category)->where('is_available', true)->get();
        return response()->json($foods);
    }

    public function getCategories()
    {
        $categories = Food::where('is_available', true)
            ->distinct()
            ->pluck('category');
        return response()->json($categories);
    }

    // ============ IMAGE UPLOAD METHOD ============
    
            public function uploadImage(Request $request)
        {
            $validator = validator($request->all(), [
                'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:4096',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'errors' => $validator->errors()
                ], 422);
            }

            try {

                $uploaded = Cloudinary::upload(
                    $request->file('image')->getRealPath(),
                    [
                        'folder' => 'foods'
                    ]
                );

                return response()->json([
                    'image_url' => $uploaded->getSecurePath(),
                    'public_id' => $uploaded->getPublicId(),
                    'message' => 'Image uploaded successfully'
                ]);

            } catch (\Exception $e) {

                return response()->json([
                    'message' => $e->getMessage()
                ], 500);
            }
        }

    // Admin only
    public function store(Request $request)
    {
        $validator = validator($request->all(), [
            'name' => 'required|string',
            'description' => 'required|string',
            'price_kes' => 'required|numeric',
            'price_usd' => 'required|numeric',
            'price_eur' => 'required|numeric',
            'category' => 'required|string',
            'image_url' => 'required|string',
            'preparation_time' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $food = Food::create($request->all());
        return response()->json($food, 201);
    }

    public function update(Request $request, $id)
    {
        $food = Food::findOrFail($id);
        $food->update($request->all());
        return response()->json($food);
    }

    public function destroy($id)
    {
        $food = Food::findOrFail($id);
    
         
        {
            $path = str_replace(asset('storage/'), '', $food->image_url);
            if (Storage::disk('public')->exists($path)) {
                Storage::disk('public')->delete($path);
            }
        }
        
        $food->delete();
        return response()->json(['message' => 'Food deleted successfully']);
    }
}