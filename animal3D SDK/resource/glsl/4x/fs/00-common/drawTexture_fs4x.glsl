/*
	Copyright 2011-2021 Daniel S. Buckstein

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

/*
	animal3D SDK: Minimal 3D Animation Framework
	By Daniel S. Buckstein
	
	drawTexture_fs4x.glsl
	Output texture blended with color.
*/

// Modified by Ryan Littleton

#version 450

// ****TO-DO: 
//	-> declare texture coordinate varying
//	-> declare sampler uniform
//		(hint: correct name is used in codebase)
//	-> get color from sampler at texture coordinate
//	-> assign color to output

layout (location = 0) out vec4 rtFragColor;

uniform sampler2D uTex_dm; // Find name in codebase
uniform vec4 uColor;

in vec4 vTexcoord;

void main()
{
	// DUMMY OUTPUT: all fragments are OPAQUE YELLOW
	//rtFragColor = vec4(1.0, 1.0, 0.0, 1.0);
	//vec4 tex = texture(uTex_dm, vTexcoord.xy);
	//rtFragColor = mix(tex, uColor, 0.5f);
	rtFragColor = texture(uTex_dm, vTexcoord.xy);
}
